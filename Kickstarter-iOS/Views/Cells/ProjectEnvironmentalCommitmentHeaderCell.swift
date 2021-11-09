import Library
import Prelude
import UIKit

public enum ProjectEnvironmentalCommitmentHeaderCellStyles {
  public enum Layout {
    public static let insets: CGFloat = Styles.grid(9)
  }
}

final class ProjectEnvironmentalCommitmentHeaderCell: UITableViewCell, ValueCell {
  // MARK: - Properties

  private lazy var titleTextLabel: UILabel = {
    UILabel(frame: .zero)
      |> \.translatesAutoresizingMaskIntoConstraints .~ false
  }()

  // MARK: - Lifecycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    self.bindStyles()
    self.configureViews()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Styles

  override func bindStyles() {
    super.bindStyles()

    _ = self
      |> baseTableViewCellStyle()
      |> \.separatorInset .~
      .init(
        top: 0,
        left: 0,
        bottom: 0,
        right: self.bounds.size.width + ProjectEnvironmentalCommitmentHeaderCellStyles.Layout.insets
      )

    _ = self.contentView
      |> \.layoutMargins .~ .init(
        topBottom: Styles.grid(1),
        leftRight: Styles.grid(3)
      )

    _ = self.titleTextLabel
      |> titleLabelStyle
  }

  // MARK: - Configuration

  func configureWith(value _: Void) {
    return
  }

  private func configureViews() {
    _ = (self.titleTextLabel, self.contentView)
      |> ksr_addSubviewToParent()
      |> ksr_constrainViewToMarginsInParent()
  }
}

// MARK: - Styles

// TODO: - Internationalize string
private let titleLabelStyle: LabelStyle = { view in
  view
    |> \.backgroundColor .~ .ksr_white
    |> \.font .~ UIFont.ksr_title1().bolded
    |> \.lineBreakMode .~ .byWordWrapping
    |> \.numberOfLines .~ 0
    |> \.text .~ "Environmental commitments"
    |> \.textColor .~ .ksr_support_700
}
